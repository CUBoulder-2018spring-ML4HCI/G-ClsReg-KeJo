# Team Members
Jonathan Fermin and Kevin Flynn

#Demo Video
[Link to our Video](https://www.google.com)

# Goals
- Create an input using some kind of hardware tool
- Learn to create a project that incorporates regression and classification
- Make a music teacher using processing

# Tools
We used a keypress input that triggered a sound through processing, incrementing by frequency. This would give a basic MIDI keyboard made through OSC messages. 
Then the MFCC 13 input would take the sounds that were triggered and classify them as right or wrong in a sequence. If the sequence was right, then the teacher program would output "good job, you played an A scale"

# ML Choices
We used Neural Networks initially for the piano keyboard using the laptop, however after realizing that the ASCII values don't really map correctly,
we ended up using classification with kNN for ease of use. The output side uses classification as well, using kNN, however this didn't work as well and is up for a change.

# Accomplished
During out project, we were successfully able to incorporate using a keyboard as an input to control an output. 
This controlled the teaching program that would classify inputs, allowing one to create teaching algorithms that would show how to play an instrument, namely the piano.

# Challenges
Some of the challenges that we faced during this project was getting our xbox controller to communicate with our input. We were unable to find a way to send the xbox inputs straight to wekinator, so we were able to find a work around by using software that allowed us to map the xbox controller to a keyboard. 
After that we were able to send keyboard inputs to wekinator and solved our problem that way. 

Due to the amount of literal noise, the MFCC 13 audio input was not sufficient for the teaching program.
Also, incrementing the sound on keypress doesn't always work, especially for regression, so for example purposes, we used classification.


# What We Learned
From this project, we learned how to successfully combine regression and classification into one project. 
Not only that, but we were successfully able to implement some kind of hardware and write our own program that controlled this. 
Before this I personally have only used example inputs and outputs from Kadenze, but this project allowed us to be more creative and create something fun.
Overall, sound input is definitely hard, so working with that much noise can be difficult. Smoothing with WekiInputHelper or in processing is incredibly necesssary.

