# Data Collector: CSV Summarizer

`csv_summarizer` is a Bash script for automatically downloading, extracting, and summarizing tabular datasets from the [UCI Machine Learning Respository](https://archive.ics.uci.edu/). It generates a clean `summary.md` report that includes feature listings and basic statistics (min, max, mean, standard deviation) for numerical columns.


## Requirements

    1. Bash shell (Linux/macOS or WSL on Windows)

    2. 'wget', 'awk', 'sed', and 'unzip' installed


## Installation

Clone the assignment repository and navigate into the `cs131/a2/` directory:

```bash
git clone https://github.com/rdawg101/cs131.git
cd cs131/a2/datacollector.sh

Make sure the script is executable by running the command:
chmod +x csv_summarizer


## Usage

Run the script with:

./csv_summarizer


You will be prompted to:

    1. Enter a URL pointing to a tabular dataset hosted on the UCI Machine Learning Respository
    
    2. Enter the column index numbers for numerical feautures within each .csv file to be shown in the summary table
    (A list of headers with their associated indices will be displayed to the user)

After processing, a summary.md file will be generated in the same directory. You can see the summary file
by running:

cat summary.md
