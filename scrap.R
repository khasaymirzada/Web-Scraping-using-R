library('rvest')

#Specifying the url for desired website to be scraped
url <- 'https://www.imdb.com/chart/top/'

#Reading the HTML code from the website
webpage <- read_html(url)
#Using CSS selectors to scrape the rankings section
movie_name<- html_nodes(webpage,'.titleColumn a')

#Converting the ranking data to text
movie_name<- html_text(movie_name)

movie_year<- html_nodes(webpage,'.secondaryInfo')

#Converting the ranking data to text
movie_year<- html_text(movie_year)

movie_rating<- html_nodes(webpage,'strong')

#Converting the ranking data to text
movie_rating<- html_text(movie_rating)

all_movies=data.frame(movie_name,movie_year,movie_rating)
all_movies$movie_year=gsub("[()]","",all_movies$movie_year)
