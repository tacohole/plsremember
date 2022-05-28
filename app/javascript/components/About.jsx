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
                  ## what is please remember? ##<br></br>
                  it's a website where you give me your email address, and i send you a little tweet-length<br></br>
                  message to that email once a day. i won't send you anything else, i won't ask you for any money,<br></br>
                  i won't give your email address to anyone, and i'll never put an ad on this site or in an email.<br></br>
                  <br></br>
                  ## why did you do this? ##<br></br>
                  i was inspired by Matthew Ogle's <a href='https://tinyletter.com/pome'>pome</a>, a tinyletter that delivers a poetry<br></br>
                  snippet every day. instead of signing up for tinyletter i wanted to roll my own. my intention<br></br>
                  is to add a few more ounces of joy to the day of anybody who signs up.<br></br>
                  <br></br>
                  ## where do these messages come from? ##<br></br>
                  wherever. some of them are from a fortune cookie database, some of them are from a list of affirmations i found,<br></br>
                  some of them are from my favorite books, movies, or poems. none of them are mine. i don't attribute them<br></br>
                  because for me, the lack of context broadens their potential meaning. if you want to know the source of<br></br>
                  a particular message, you can email me.<br></br>
                  <br></br>
                  ## who are you? ##<br></br>
                  please remember is a project by Troy Coll. he's an aspiring software engineer based in Raleigh,<br></br>
                  North Carolina. you can contact him at troy@plsremember.com.<br></br>
               </p>
            </div>
        </div>
    </div>
</div>
  )
}

export default About