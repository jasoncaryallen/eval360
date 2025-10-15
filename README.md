[![Build Status](https://travis-ci.org/rockwoodleadership/eval360.svg?branch=master)](https://travis-ci.org/rockwoodleadership/eval360)

## Rockwood 360 Eval Software

### Requirements

- Ruby 2.5.0
- Rails 5.2.0
- Postgresql 9.4
- Heroku stack: Heroku-18

#### Setup

0 To set up this environment locally, please get the necessary login info to Github, Heroku, Salesforce, and Mailchimp (you will access Mandrill through here) from Joi or Amie.

1 Fork the repo

```
[https://help.github.com/articles/fork-a-repo/](https://help.github.com/articles/fork-a-repo/)
```

2 Run the below script

```
./script/newb
```

3 Create a .env file with the following using the associated keys found in Heroku:

```
MANDRILL_APIKEY="MANDRILL_APIKEY"
DATABASEDOTCOM_CLIENT_ID="1234"
DATABASEDOTCOM_CLIENT_SECRET="secret"
DATABASEDOTCOM_HOST="test.salesforce.com"
INBOUND_SALESFORCE_KEY="example"
SALESFORCE_PASSWORD="passwordsecuritytoken"
SALESFORCE_USERNAME="example@email.com"
```

#### Start

```
thin start --ssl
```

#### Test

```
rake
```

#### Development Setup

1.  Create some entities in the rails console

    1.  `Questionnaire`
    1.  `Training`
    1.  `Participant`s
    1.  `Evaluation`s and `Evaluator`s

    ```ruby
    Questionnaire.generate_from_yaml('config/questionnaires/Standalone.yml')
    t = Training.create(name: 'rockwood test', start_date: 5.days.ago, end_date: 2.months.from_now, status: 'In progress', questionnaire_id: 1, city: 'San Francisco', state: 'Ca')
    p = t.participants.create(first_name: 'Joe', last_name: 'Smith', email: 'joe@example.com')
    Evaluation.create_self_evaluation(p)
    peer = t.participants.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com')
    Evaluation.create_self_evaluation(peer)
    Evaluation.create_peer_evaluations([peer.reload.evaluator], p)
    ```

2.  Continue setup in admin panel
3.  We have the ability to create new questionnaires/sections/questions in the software too.
4.  Some actions enqueue delayed jobs (updating evaluations and sending pdf reports). To run jobs locally you can use `rails jobs:workoff`

Please find the documentation for DelayedJob, ActiveAdmin, Formtastic, and Slim for reference.

#### Up and Running with Docker Compose

1. Install Docker
1. `docker compose build`
1. `docker compose up`
1. `docker compose exec app bash`
1. `bin/rails db:create db:migrate`

OPTIONAL IF ENCOUNTERING MIGRATION OR SCHEMA ISSUES

1. `docker compose exec app bash`
1. `bin/rails db` to get to a postgres prompt
1. In postgres: `INSERT INTO ar_internal_metadata ("key", "value", "created_at", "updated_at")
VALUES ('environment', 'development', now(), now()) RETURNING "key";`
