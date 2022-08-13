import React from "react";

import './Sample.css'

const samples = [
  {
    quote : "Everybody wants to go to heaven, but nobody wants to die.",
    author : "Andre 3000",
    link : "https://www.youtube.com/watch?v=GI0qQoFpFJI"
  },{
    quote : "We are here on earth to fart around, and don't let anybody tell you any different.",
    author : "Kurt Vonnegut",
    link : "https://en.wikipedia.org/wiki/A_Man_Without_a_Country"
  },{
    quote : "Rules are made to be broken. Injustice makes the rules, and courage breaks them.",
    author : "Ursula K. LeGuin",
    link : "https://en.wikipedia.org/wiki/Ursula_K._Le_Guin"
  }
]

const delay = 5000

function Sample () {
  const [index, setIndex] = React.useState(0);
  const timeoutRef = React.useRef(null);

  function resetTimeout() {
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }
  }

  React.useEffect(() => {
    resetTimeout();
    timeoutRef.current = setTimeout(
      () =>
        setIndex((prevIndex) =>
          prevIndex === samples.length - 1 ? 0 : prevIndex + 1
        ),
      delay
    );

    return () => {
      resetTimeout();
    };
  }, [index]);

return (
    <div className="samples">
      <div className="sampleSlider"
      style={{ transform: `translate3d(${-index * 100}%, 0, 0)` }}
      >
        {samples.map((sample, index) => (
          <div
            className="sample"
            key={index}
          >{sample.quote}
          <br></br>
          - <a href={sample.link}>{sample.author}</a>
        </div>
        ))}
      </div>
    </div>
  );
}

export default Sample