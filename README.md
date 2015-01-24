## What's this project?

This is a project for demonstrating the VIPER(View-Interactor-Presenter-Entity-Routing), which is an approach to iOS application architecture. 
Also, it is a variant of VIPER that integrated with my own understanding of the concept and some practical experience, which I think will make it more flexible and suitable for different kinds of projects.

The idea was inspired from [HERE](http://www.objc.io/issue-13/viper.html)


## Routing

It takes care all the navigation logic in the application, we describe which screens are shown in which order here. 
Also, it takes the responsibility of creating all the view controllers, presenters and interactors, and wire them up.
It is like playing a glue role in the application, putting every picecs together so others should only need to worry about their own jobs.

Here is a sequence diagram of Routing which will help you to get an overview of it and know how it works:
![Routing Sequence](Documents/RoutingSequence.png)


## View

