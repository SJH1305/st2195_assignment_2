# Reading a HTML using rvest 
# Ensure url is enclosed in "_"
# cars is an HTML object which represents the entire webpage.
cars <- read_html("https://en.wikipedia.org/wiki/Comma-separated_values")

# Extract all tables
tables <- cars %>% html_elements("table")

# Check how many tables are on the page
length(tables)

# length(tables) returned 3, that means the Wikipedia page contains three tables. 

# Loop through each table and print its content
for (i in 1:length(tables)) {
  print(paste("Table", i))
  print(html_table(tables[[i]], fill = TRUE))  # Print the content of the table
}

# Extract the second table
car_data <- html_table(tables[[2]], fill = TRUE)  
print(car_data)

# Save as CSV, without row names
write.csv(car_data, "car_data.csv", row.names = FALSE)  

