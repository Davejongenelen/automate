
my_new_try: data/reviews.csv data/listings.csv temp/aggregated_df.csv temp/pivot_table.csv output/plot_Antwerp.pdf output/plot_all.pdf

all: output/plot_Antwerp.pdf output/plot_all.pdf

data/reviews.csv data/listings.csv: src/download_data.R
		R --vanilla < src/download_data.R


temp/aggregated_df.csv: src/automate.R data/reviews.csv data/listings.csv
		R --vanilla < src/automate.R

temp/pivot_table.csv: src/export_pivot.R temp/aggregated_df.csv
		R --vanilla < src/export_pivot.R
	
output/plot_Antwerp.pdf: src/plot_antwerp.R temp/pivot_table.csv
		R --vanilla < src/plot_antwerp.R 
		
output/plot_all.pdf: src/plot_all.R temp/aggregated_df.csv
		R --vanilla < src/plot_all.R