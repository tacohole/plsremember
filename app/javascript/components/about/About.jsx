import React from 'react';
import './About.css'

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
              <h3>What is Please Remember?</h3>
               <p>
                  It's a website where you give me your email address, and I send 
                  a little tweet-length message to that email once a day. It might be <a href="https://silverbirchpress.wordpress.com/2013/06/13/the-plum-trees-poem-by-mary-oliver/">a poetry snippet</a>,
                  or a <a href="https://www.youtube.com/watch?v=wNG_uJhCbbI">scene</a> from The Sopranos, or a <a href="https://www.youtube.com/watch?v=guqFqcV4Po0">song</a>, or a sports highlight. 
                  I won't send you anything aside from the daily message, I won't ask you for any money, I won't give your email
                  address to anyone, and I'll never put an ad on this site or in an email.
                </p>
              <h3>Why did you do this?</h3>
                 <p>I was inspired by Matthew Ogle's <a href='https://tinyletter.com/pome'>pome</a>, 
                 a tinyletter that delivers a poetry snippet every day. Instead of signing up for 
                 tinyletter I wanted to roll my own, and include other media in addition to straight-up poetry. 
                 My intention is to add a few ounces of delight to the day of anyone who signs up.
                </p>
                  <h3>Who are you?</h3>
                  <p>Please Remember is a project by Troy Coll. He's a software developer based in Raleigh,
                  North Carolina. You can contact him at <a href="mailto:troy@pleaseremember.io">troy@pleaseremember.io</a>, 
                  and view <a href="https://github.com/tacohole/plsremember">this work</a> and others 
                  on GitHub.
                </p>
            </div>
        </div>
    </div>
</div>
  )
}

export default About