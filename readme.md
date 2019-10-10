## Quickstart
To run the whole test suite with both backend and frontend scenarios:
    `rake features`
To run a tagged scenarios by all backend tests by running
    `cucumber -t @TAG --format pretty --format html --out results.html`

To a tagged scenarios by all backend tests by running
    `cucumber -t @backend --format pretty --format html --out results.html`

To run a specific feature file:
	`cucumber features/FILENAME.feature --format pretty --format html --out results.html`

Ie: This commands runs only backend.feature file
	`cucumber features/backend.feature --format pretty --format html --out results.html`

To run a specific scenario at line number 4, in a feature file:
    `cucumber features/backend.feature:4 --format pretty --format html --out results.html`
    
## Test Result
After each test execution results.html file gets created

## Test Setup
Test setup with cucumber, capybara, selenium-webdriver and rspec.

#### Step 1: Install Ruby
First thing to do is installing ruby (version 2.0.4). You can do this by:

    `brew install ruby`

And you can install Bundler by:

    `sudo gem install bundler`

#### Step 2: Install gems

CD into the marcol folder and run to install gems:

    `bundle install`
