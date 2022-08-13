import React from "react";

import Sample from "./sample/Sample";
import Subscribe from "./subscribe/Subscribe";
import Description from "./description/Description"
import Instructions from "./instructions/Instructions"

function Home () {

    return (
        <div className="vw-100 vh-100 primary-color d-flex justify-content-center">
            <div className="jumbotron jumbotron-fluid bg-transparent">
                <div className="container secondary-color">
                    <h1 className="display-4">Please Remember</h1>
                    <p>
                        A joyful reminder sent to your inbox every day
                    </p>
                    <hr className="my-4"/>
                     <div>
                        <Description />
                        <Sample />
                        <Instructions />
                        <Subscribe />
                    </div>
                </div>
            </div>
        </div>
    )

}

export default Home