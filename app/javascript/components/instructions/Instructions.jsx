import React from 'react';

import './Instructions.css'

function Instructions () {
  return (
    <div className="instructions">
      <h3>Okay how does this work exactly?</h3>
      <li>Put your email in the box below, check the captcha, and click "Subscribe"</li>
      <li>Check your email for the verification link (it'll be sent from verify@pleaseremember.io)</li>
      <li>Click "Verify" in that email</li>
      <li>That's it! You'll receive your first message the following day.</li>
      <li>If you ever get sick of it, each email has an "Unsubscribe" link you can hit to opt out.</li>
      <br></br>
    </div>
  );
}

export default Instructions