import React from 'react';

const About = () => {
  return (
    <div className="vw-100 vh-100 primary-color d-flex justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
            <h1 className="display-4">Please Remember</h1>
            <p>
                A joyful reminder sent to your inbox once daily
            </p>
            <hr className="my-4"/>
             <div>
               <p>
                  ## What is Please Remember? ##<br></br>
                  It's a website where you give me your email address, and I send a little tweet-length<br></br>
                  message to that email once a day. I won't send you anything else, I won't ask you for any money,<br></br>
                  I won't give your email address to anyone, and I'll never put an ad on this site or in an email.<br></br>
                  <br></br>
                  ## Why did you do this? ##<br></br>
                  I was inspired by Matthew Ogle's <a href='https://tinyletter.com/pome'>pome</a>, a tinyletter that delivers a poetry<br></br>
                  snippet every day. Instead of signing up for tinyletter I wanted to roll my own. My intention<br></br>
                  is to add a few more ounces of delight to the day of anybody who signs up.<br></br>
                  <br></br>
                  ## Where do these messages come from? ##<br></br>
                  Wherever. Some of them are from a fortune cookie database, some of them are from a list of affirmations I found,<br></br>
                  some of them are from my favorite books, movies, or poems. None of them are mine.<br></br>
                  <br></br>
                  ## Who are you? ##<br></br>
                  Please remember is a project by Troy Coll. He's a software developer based in Raleigh,<br></br>
                  North Carolina. You can contact him at troy@pleaseremember.com.<br></br>
               </p>
            </div>
        </div>
    </div>
</div>
  )
}

export default About