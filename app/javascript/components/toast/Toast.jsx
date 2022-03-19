import React, { useState, useEffect} from 'react';
import './Toast.css';

const Toast = (props) => {
    const [toastList, position] = props;
    const [list, setList] = useState(toastList);
    return (
        <div className={`notification-container ${position}`}>
            <button>

            </button>
            <div className={`notification toast ${position}`}>
                <img src="" alt="" />
              </div>
              <div>
                  <p className="notification-title">Title</p>
                  <p className="notification-message">Message</p>
              </div>
        </div>
    )
}

export default Toast;