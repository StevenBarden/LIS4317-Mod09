# --------------------------------------------------------------------
# SECTION 1   : COURSE AND ASSIGNMENT DETAILS
# --------------------------------------------------------------------
# Course      : LIS-4370 R Programming
# Assignment  : Module 9
# URL         : https://usf.instructure.com/courses/LIS-4370
# Filename    : LIS4370-Mod9.R
# Purpose     : Demonstrate three types of data visualizations using the mtcars dataset.
# Author      : Steven Barden
# Email       : StevenBarden@usf.edu
# Created     : 2025-03-24-1554.32 (EST)
# Updated     : 2025-03-24-1701.23 (EST)
# License     : The Unlicense
# Description : This script explores the mtcars dataset by generating three visualizations 
#               (base R, lattice, and ggplot2) to compare MPG and horsepower relationships, 
#               fulfilling Module 9?s requirement to evaluate different R visualization methods.
#
# --------------------------------------------------------------------
# SECTION 2: ENVIRONMENT SETUP
# --------------------------------------------------------------------

# Set Working Directory (Modify as Needed)
tryCatch({
  setwd("./")  # Default to home directory; modify if needed
}, error = function(e) {
  stop("Error setting the working directory: ", e$message)
})

# Load Required Libraries
tryCatch({
  library(ggplot2)
  library(lattice)
  library(dplyr)
}, error = function(e) {
  stop("Error loading libraries: ", e$message)
})

# --------------------------------------------------------------------
# SECTION 5: DATA LOADING
# --------------------------------------------------------------------

# Load mtcars dataset (built-in R dataset)
load_mtcars_data <- function() {
  tryCatch({
    data(mtcars)
    cat("Successfully loaded mtcars dataset.\n")
    return(mtcars)
  }, error = function(e) {
    stop("Error loading mtcars data: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 8: VISUALIZATION FUNCTIONS
# --------------------------------------------------------------------

visualize_data <- function(data) {
  tryCatch({
    cat("Creating visualizations...\n")
    
    # Visualization 1: Base R Plot (Scatterplot of MPG vs Horsepower)
    plot(data$hp, data$mpg,
         main = "Base R: MPG vs Horsepower",
         xlab = "Horsepower (hp)",
         ylab = "Miles per Gallon (mpg)",
         pch = 16, col = "blue")
    cat("Base R visualization completed.\n")
    
    # Visualization 2: Lattice Plot (Scatterplot of MPG vs Horsepower by Cylinders)
    lattice_plot <- xyplot(mpg ~ hp | factor(cyl), data = data,
                           main = "Lattice: MPG vs Horsepower by Cylinders",
                           xlab = "Horsepower (hp)",
                           ylab = "Miles per Gallon (mpg)",
                           pch = 16, col = "red")
    print(lattice_plot)
    cat("Lattice visualization completed.\n")
    
    # Visualization 3: ggplot2 Plot (Scatterplot of MPG vs Horsepower with Color by Cylinders)
    gg_plot <- ggplot(data, aes(x = hp, y = mpg, color = factor(cyl))) +
      geom_point(size = 3) +
      labs(title = "ggplot2: MPG vs Horsepower by Cylinders",
           x = "Horsepower (hp)",
           y = "Miles per Gallon (mpg)",
           color = "Cylinders") +
      theme_minimal()
    print(gg_plot)
    cat("ggplot2 visualization completed.\n")
    
    cat("All visualizations completed successfully.\n")
  }, error = function(e) {
    stop("Error creating visualizations: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 9: MAIN EXECUTION BLOCK
# --------------------------------------------------------------------

main <- function() {
  tryCatch({
    cat("Starting script execution...\n")
    
    # Step 1: Load Data
    cat("Step 1: Loading data...\n")
    mtcars_data <- load_mtcars_data()
    
    # Step 2: Visualize Data
    cat("Step 2: Visualizing results...\n")
    visualize_data(mtcars_data)
    
    cat("Script execution completed successfully.\n")
  }, error = function(e) {
    stop("Script execution failed: ", e$message)
  })
}

# Execute the main function
main()

# --------------------------------------------------------------------
# SECTION 10: VERSION HISTORY
# --------------------------------------------------------------------
# Version History:
# - Version 1.0 (2025-03-24): Initial script with three visualizations using mtcars.