# HackDavis17
Our entry to Hack Davis 2017. A simple messaging site for coordinating with study groups.

## Features

### Minimum Viable Product
+ [ ]  Ability to make groups and send invites
  + [ ] Sepereate subdomains with every group
  + [ ] Email invites and following an invite link
+ [ ]  Ability to send basic messages
+ [ ]  Ability to say commands and have them be interpereted instead of sent as message
+ [ ]  Ability to access Study Space API

### If we have time
+ [ ]  Webhooks
+ [ ]  Desktop notifications
+ [ ]  Other integrations

### Would be chill, bruh
+ [ ] Amazon Alexa Integration
+ [ ] IPhone app lol :)

## Contributing
__NOTE: We are not using a git_manager script.__

### Before Working (About to start new feature)
  1. Open github app (or terminal)
  2. Switch to master branch (or ```git checkout master```)
  3. Sync master with remote (or ```git fetch origin master``` & ```git pull origin master```)
  4. Create new branch and name it after the feature you plan on adding (or ```git branch feature-name```)
  
### After Working (Ready to merge)
  1. Open github app (or terminal)
  2. Commit changes (or ```git status``` & ```git add .``` & ```git commit -m "changes"```) [Should be in present tense]
  3. Click pull request button (or ```git push origin branch-name```)
  4. Await approval
  
## Style considerations
__NOTE: Rubocop will equate to Study Space style guide__

Run rubocop to ensure your code matches style guide.

### Comment guide
https://docs.google.com/document/d/1mOYJlvps9VxQIv48R9l8e6tFeXp6ZkxtJmqx2cDWk5E/edit?usp=sharing

## Testing locally
+ You can test locally with ```heroku local```.
+ You will need the [heroku toolbelt](https://devcenter.heroku.com/articles/heroku-cli).
+ If you have any issues with environmental variables run ```./env_manager```.
+ __Remember__: Changes to JS and CSS don't change must be precompiled run ```rake assets:precompile``` & ```rake assets:clean```

+ If you don't have a Heroku account make one! Remind me to add you to the collaborator list.
