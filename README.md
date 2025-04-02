# Flight Booker

A simple one-way flight booking application built as part of [The Odin Project's Ruby on Rails curriculum](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker).

## Project Overview

This application allows users to:

- Search for available flights based on desired dates, departure and arrival airports
- Select from available flights
- Enter passenger information
- Book flights with multiple passengers
- Receive a confirmation email (when configured)

### Key Features

- Advanced forms with nested attributes
- Date-based search functionality
- Multiple model associations
- Email notifications

## Setup Instructions

### Prerequisites

- Ruby (version 3.0.0 or higher)
- Rails (version 7.0.0 or higher)
- PostgreSQL

### Installation

1. Clone the repository

```
git clone https://github.com/your-username/odin-flight-booker.git
cd odin-flight-booker
```

2. Install dependencies

```
bundle install
```

3. Database setup

```
rails db:create
rails db:migrate
rails db:seed
```

4. Start the server

```
rails server
```

5. Visit `http://localhost:3000` in your browser

## Learning Objectives

- Building advanced forms with complex requirements
- Managing multiple model associations
- Working with date-based queries
- Implementing nested forms
- Sending confirmation emails
