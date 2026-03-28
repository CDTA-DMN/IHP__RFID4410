#!/bin/bash
# spice2sym_multi.sh
# Processes ALL subcircuits in a SPICE file
# Usage: ./spice2sym_multi.sh <spice_file> [output_dir]

SPICE_FILE="$1"
OUTPUT_DIR="${2:-.}"
STEP=20

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to generate a single symbol
generate_symbol() {
    local SYM_NAME="$1"
    local PINS="$2"
    local OUTPUT_FILE="$OUTPUT_DIR/${SYM_NAME}.sym"
    
    # Count pins
    local PIN_COUNT=$(echo $PINS | wc -w)
    local HEIGHT=$((PIN_COUNT * STEP))
    local CHARS=${#SYM_NAME}
    local WIDTH=$((CHARS*10 +30))
    
    # Generate the symbol header
    cat > "$OUTPUT_FILE" << EOF
v {xschem version=3.4.BRC file_version=1.4}
S {}
E {}
K{type=primitive
format="@name @pinlist @symname"
template="name=X1"
}
EOF
    
    # Generate pin lines and labels
    local i=0
    for pin in $PINS; do
        local Y=$((10 + i * STEP))
        echo "L 4 -20 $Y 0 $Y {}" >> "$OUTPUT_FILE"
        echo "T {$pin} 5 $((Y-5)) 0 0 0.2 0.2 {}" >> "$OUTPUT_FILE"
        ((i++))
    done
    
    # Generate pin boxes
    i=0
    for pin in $PINS; do
        local Y=$((10 + i * STEP))
        local Y1=$((Y - 5/2))
        local Y2=$((Y + 5/2))
        echo "B 5 -22.5 $Y1 -17.5 $Y2 {name=$pin dir=inout}" >> "$OUTPUT_FILE"
        ((i++))
    done
    
    # Generate the main box and label
    cat >> "$OUTPUT_FILE" << EOF
P 4 5 $WIDTH 0 0 0 0 $HEIGHT $WIDTH $HEIGHT $WIDTH 0 {}
T {@symname} 40 $((HEIGHT/2 - 10)) 0 0 0.3 0.3 {} 
EOF
    
    echo "Generated $OUTPUT_FILE"
}

# Method 1: Process each subcircuit line by line
echo "Processing $SPICE_FILE..."

# Read the SPICE file line by line
current_subckt=""
current_pins=""
in_subckt=false
line_num=0

while IFS= read -r line || [[ -n "$line" ]]; do
    ((line_num++))
    
    # Check for .subckt line
    if [[ "$line" =~ ^\.subckt\ +([^ ]+) ]]; then
        # If we were already processing a subckt, save it first
        if [ -n "$current_subckt" ]; then
            echo "  Found subcircuit: $current_subckt"
            generate_symbol "$current_subckt" "$current_pins"
        fi
        
        # Start new subcircuit
        current_subckt="${BASH_REMATCH[1]}"
        
        # Extract pins from the rest of the line
        current_pins=$(echo "$line" | awk '{$1=$2=""; print $0}' | xargs)
        in_subckt=true
        
    # Check for .ends line
    elif [[ "$line" =~ ^\.ends ]] && [ "$in_subckt" = true ]; then
        # Generate the symbol for the current subcircuit
        if [ -n "$current_subckt" ]; then
            echo "  Found subcircuit: $current_subckt"
            generate_symbol "$current_subckt" "$current_pins"
        fi
        
        # Reset for next subcircuit
        current_subckt=""
        current_pins=""
        in_subckt=false
        
    # If we're inside a subckt and the line might continue pins
    elif [ "$in_subckt" = true ] && [ -z "$current_pins" ]; then
        # Some SPICE files continue pins on next line
        if [[ ! "$line" =~ ^[+] ]]; then  # Not a continuation line
            current_pins="$line"
        fi
    fi
done < "$SPICE_FILE"

# Handle last subcircuit if file doesn't end with .ends
if [ -n "$current_subckt" ]; then
    echo "  Found subcircuit: $current_subckt"
    generate_symbol "$current_subckt" "$current_pins"
fi

echo "Done. Symbols saved in $OUTPUT_DIR/"	
