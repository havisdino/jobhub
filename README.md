# JobHub

JobHub is a job search website that utilizes advanced technology to provide users with an intuitive and efficient job search experience. The website features an autosuggestion tool that helps users find relevant job listings based on their skillset and preferences.

Give it a try at [JobHub on Render](jobhub-dmi0.onrender.com).

## Features

1. Autosuggestion: The website uses advanced algorithms to suggest job listings based on user input, such as skills and job title.
2. Filtering: Users can filter job listings by location, salary range, job type, industry, and other criteria.
3. Saved Searches: Users can save their search criteria and receive notifications when new jobs matching their criteria become available.
4. Application Tracking: Users can keep track of the jobs they have applied for and their application status.
5. Career Resources: The website offers a variety of career resources, including resume tips, interview advice, and industry insights.

## Technologies Used

1. HTML/CSS ✅
2. Django ✅
3. PostgreSQL ✅
3. RESTful API (In progress)
4. NLP for Autosuggestion (In progress)

## Getting Started

* Clone this repository
```
git clone https://github.com/havisdino/jobhub.git
```
* Start ```psql```, create a database and the owner
```
CREATE USER <your-user-name> WITH PASSWORD '<your-pass-word>';
CREATE DATABASE jobhub WITH OWNER <your-user-name>;
```
* Configure the .env file with your own settings.
* Go to [jobhub](jobhub/), make migrations and apply them all
```
cd jobhub
python manage.py makemigrations polls
python manage.py migrate
```
* Start the server
```
python manage.py runserver
```

## Contributors

[Ha Dinh](https://github.com/havisdino), [Tung Nguyen](https://github.com/tunglm271), [Nam Thai](https://github.com/littlegiant56)  
We welcome contributions from the organization! If you're interested in contributing to the project, please fork the repository and submit a pull request with your changes.
