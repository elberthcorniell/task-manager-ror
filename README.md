# Deadline - An opensource task manager
 A task manager for everything

![Desdline tasks manager](./.github/capture.png) <br>

## Built With 

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

[Heroku Live Demo](https://ciao-social-ror.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

For testing please escute the next steps:

- Execute the following code on the terminal to get the Gems needed:

```
    bundle install
```

- Make sure to have the testing database running:

```
    rails db:create db:migrate RAILS_ENV=test
```

- Run the test with the following command:

```
    rpsec --format documentation
```

## Authors

👤 **Elbert Corniel**

- GitHub: [@elberthcorniell](https://github.com/elberthcorniell)
- Twitter: [@elberthcorniell](https://twitter.com/elberthcorniell)
- LinkedIn: [Elbert Corniell](https://www.linkedin.com/in/elberthcorniell)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Gregoire Vella on Behance](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding)

## 📝 License

[MIT](./LICENSE)