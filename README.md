# Rails Diet and Fitness Tracker

This is a rails app for tracking diet and fitness daily. Follow the directions to get it running.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Installing

First run bundle to install the dependencies and gems:
`bundle install`

Then create a .ENV file with the following information to get the google OmniAuth to work:
`GOOGLE_CLIENT_ID=YOUR_CLIENT_ID
GOOGLE_SECRET=YOUR_SECRET`

Then set up the database:
`rails db:migrate`

Then start the server:
`rails s`

If you want to play around with some sample data, check out the seed file in the db folder. It will create 30 days of sample data that will let you visualize what the tracker looks like.

## Built With

* [Rails](https://rubyonrails.org/) - The web framework used
* [Bootstrap](https://getbootstrap.com/) - For the layouts
* [Chartkick](https://chartkick.com/) - To make the charting easy as cake
* [Highcharts](https://www.highcharts.com/) - the charting engine


## Authors

**Aaron Schuyler**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to my fellow flatiron students for pointing me in the right direction on a few things.
