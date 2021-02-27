![](https://img.shields.io/badge/Rails-6.1.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.5.3-orange) 

# Software Engineering Work Sample

## Overview

This repo represents a simple web application that does CRUD operations on a database. The scenario is as follows:

Imagine a small community college wants to provide students with an online tool for course registration. Every student already has a credential that they receive when they are accepted to the college so we have a means of authenticating them.
  
  * Model students with id, name and email address
  
  * Model courses with name, time, and id
  
  * Model course registration to associate students with their courses
  
  * Create a simple web UI for students to:
  
    - View available courses
    - Register for courses
    - View their course registrations
    - Cancel registration

## Table of Contents
  - [Setup](#setup)
  - [Schema](#schema)
  - [Navigating the Pages](#navigating-the-pages)
  - [Running the Tests](#running-the-tests)



## Setup
#### Prerequisites
These setup instructions are for Mac OS.

This project requires the use of `Ruby 2.5.3` and `Rails 6.1.3`.
`PostgreSQL` was used for the database.

##### Install Necessary Programs

1. Verify your machine has the correct version of Ruby installed (2.5.3).  You can check this by entering `ruby -v` from the command line.
    - To install, enter `rbenv install 2.5.3` from the command line.   

2. Verify your machine has the correct version of Rails installed (6.1.3).  You can check this by entering `rails -v` from the command line.
    - To install, enter `gem install rails -v 6.1.3` from the command line.

##### Local Repo Setup
1. Fork & Clone Repo
2. Run `bundle install`.
3. Setup database: `rails db:create` and `rails db:seed`.


## Schema

![Untitled](https://user-images.githubusercontent.com/60626984/109400405-c7464280-7905-11eb-8ec3-70ff08d44c21.png)

## Navigating the Pages
### Seed Data
I have created some seed data to help get started. 
```
Students
student1 = Student.create(name: "Sally Jones", email: "sally@email.com")
student2 = Student.create(name: "Ben Harper", email: "ben@email.com")
student3 = Student.create(name: "Latisha Brown", email: "latisha@email.com")
student4 = Student.create(name: "Calvin Jenkins", email: "calvin@email.com")

Courses
course1 = Course.create(name: "Business", time: "11:15 AM")
course2 = Course.create(name: "Engineering", time: "2:20 PM")
course3 = Course.create(name: "Finance", time: "8:30 AM")
course4 = Course.create(name: "Economics", time: "4:25 PM")
```

From the command line, open a new tab and run `rails s` to start a local server (`localhost:3000`). 

### Courses Index
Add the following URI to the `localhost:3000` URL

`/courses`

On this page you will see a list of all **Available courses** with the following fields:
  - Name
  - Time
  
You can then click on the name of the course to be taken to that courses show page.

### Courses Show
Upon clicking the course name, you are taken to: (/courses/:id)

Example: `/courses/1`

On this page you will see the course:
  - Name 
  - Time
  - A field for the student to enter their email
  - A button to Register 

You will need to use one of the emails listed above under Seed Data to register. Upon clicking 'Register', you will be taken to that students show page.

** I took the liberty to allow students to register and unregister by looking them by email, thus giving access to the `student_id`. I chose to do it this way for times sake. Traditionally the student info would be stored and accessed via a session. 

### Students Show
Upon clickin 'Register', you are taken to : (/students/:id)

Example: `/students/4`

On this page you will see:
  - Students Name Courses
  - The name of the course they are registered in
  - The time of the courese they are registered in
  - A button to 'Cancel Registration'

When you click on the `Cancel Registration` you are will remain on the student show page and the course will be removed.


## Running the Tests

To run all of the test:
```
bundle exec rspec
```
To run a suite of tests:
```
bundle exec rspec/spec/features
```
or
```
bundle exec rspec/spec/models
```
To run a specific test:
``` 
bundle exec rspec/spec/features/<name of directory>/<filename>.rb:<line#>
``` 
