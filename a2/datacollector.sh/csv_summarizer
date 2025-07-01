#!/bin/bash

echo "Enter a URL to a CSV dataset: "
read url

mkdir -p tempdata
cd tempdata

filename=$(basename "$url")
wget -q "$url" -O "$filename"

if [[ "$filename" == *.zip ]]; then
    unzip -o "$filename" > /dev/null
    csv_files=(*.csv)
else
    csv_files=("$filename")
fi

# Remove old summary
rm -f ../summary.md

for csv in "${csv_files[@]}"; do
    echo "Processing $csv..."

    # Detect separators
    separator=$(awk 'NR==1 {c=gsub(",", ","); s=gsub(";", ";"); print (s > c) ? ";" : ","; exit}' "$csv")

    # Extract headers
    headers=()
    while IFS="$separator" read -r -a fields; do
        for field in "${fields[@]}"; do
            clean_field=$(echo "$field" | sed 's/^"//;s/"$//')
            headers+=("$clean_field")
        done
        break
    done < "$csv"

		# Prompt for indexes specific to this CSV
		echo -e "\n## Feature Index and Names in $csv"
		for i in "${!headers[@]}"; do
	    echo "$((i+1)). ${headers[$i]}"
		done

echo -e "\nEnter the column index numbers for numerical features in $csv (e.g. 1,3,5): "
read input_indexes
indexes=($(awk -F',' '{for(i=1;i<=NF;i++) print $i}' <<< "$input_indexes"))

    # Write to summary
    {
        echo -e "# Feature Summary for $csv\n"
        echo "## Feature Index and Names"
        for i in "${!headers[@]}"; do
            echo "$((i+1)). ${headers[$i]}"
        done

        echo -e "\n## Statistics (Numerical Features)"
        echo "| Index | Feature           | Min   | Max   | Mean   | StdDev |"
        echo "|-------|-------------------|-------|-------|--------|--------|"

        for idx in "${indexes[@]}"; do
            col=$((idx))
            feature="${headers[$((col-1))]}"

            stats=$(awk -F"$separator" -v col="$col" '
                NR > 1 && $col ~ /^[0-9.]+$/ {
                    val = $col + 0
                    sum += val
                    sumsq += val^2
                    if (NR == 2 || val < min) min = val
                    if (NR == 2 || val > max) max = val
                    count++
                }
                END {
                    if (count > 0) {
                        mean = sum / count
                        stddev = sqrt(sumsq / count - mean^2)
                        printf "%.2f %.2f %.3f %.3f", min, max, mean, stddev
                    } else {
                        print "0.00 0.00 -nan -nan"
                    }
                }
            ' "$csv")

            printf "| %-5s | %-18s | %s |\n" "$idx" "$feature" "${stats// / | }"
        done

        echo ""
    } >> ../summary.md

done

cd ..
rm -rf tempdata
