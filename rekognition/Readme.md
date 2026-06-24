# Create bucket & upload file

```sh
aws s3 mb s3://rekog-example-2018
aws s3 cp picard.jpg s3://rekog-example-2018
```

# Run ruby code

```sh
bundle install
bundle exec ruby main.rb

```