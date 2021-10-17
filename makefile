all: plot_Antwerp.pdf plot_all.pdf

reviews.csv listings.csv: download_data.R
		R --vanilla < download_data.R


aggregated_df.csv: automate.R reviews.csv listings.csv
		R --vanilla < automate.R

pivot_table.csv: export_pivot.R aggregated_df.csv
		R --vanilla < export_pivot.R
	
plot_Antwerp.pdf: plot_antwerp.R pivot_table.csv
		R --vanilla < plot_antwerp.R 
		
plot_all.pdf: plot_all.R aggregated_df.csv
		R --vanilla < plot_all.R