Tournament Pairings and Results Database

tournament.py tournament.sql tournament_test.py
All forked from Udacity template files and modified by Mark Scherschel.

To get started:
Clone the repository: git clone https://github.com/schersch/udacity_fsd_project_2.git
Necessary files can be found in /vagrant/Tournament.
Set up the database and then set up tables and views by running tournament.sql
>vagrant=> CREATE DATABASE tournament;
>.../vagrant/tournament$ psql -f tournament.sql
The tests can then be run
>.../vagrant/tournament$ python tournament_test.py
Instructions for installing Vagrant and a more detailed project description can be found 
    in Udacity course: Intro to Relational Databases - Lesson 5.

Using the database:
The current implementation does not prevent rematches, requires an even number of
    participants, and does not support multiple tournaments.

Licensing:
There is no license for any original files.
