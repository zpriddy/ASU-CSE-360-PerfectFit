ASU-CSE-320-PerfectFit
======================

This is a rails app created for a class project for ASU's CSE360 class. It is a health tracker webapp that will run on any rails enabled server. 

You can demo the site from:
http://perfectfit.redxns.com

Server Configuration:
=====================
ruby: v2.0.0
rails: v4.0.4

after configuring rails and ruby on your server run these commands:
$ bundle install --without production
$ rake db:migrate
$ passanger start 

you can they access the app localy at:
http://localhost:3000