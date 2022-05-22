import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <div>
      <li>
        <Link to="/">Home</Link>
      </li>
      <li>
        <Link to="/about">About</Link>
      </li>
    </div>
  )
}

export default Header