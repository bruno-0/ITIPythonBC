import React, { useState } from "react";
import "./App.css";

const App = () => {
  const [counter, setCounter] = useState(0);
  const handleClick = () => {
    setCounter(counter + 1);
  };
  let obj1 = {
    id: "1",
    jobTitleName: "Developer",
    firstName: "Ahmed",
    lastName: "Ali",
    preferredFullName: "Ahmed Ali",
    employeeCode: "E1",
    region: "CA",
    phoneNumber: "408-1234567",
    emailAddress: "ahmed.ali@gmail.com",
  };
  const objEntries = Object.keys(obj1).map(key => (
    <p value={key}>{obj1[key]}</p>
  ));

  return (
    <div
      style={{
        fontSize: "100%",
        width: "100%",
        height: "100%",
      }}
    >
      Counter
      <div
        style={{
          fontSize: "120%",
        }}
      >
        {counter}
      </div>
      <div className='buttons'>
        <button
          style={{
            fontSize: "60%",
          }}
          onClick={handleClick}
        >
          Increment
        </button>
      </div>
      <div>
        <p>{objEntries}</p>
      </div>
    </div>
  );
};

export default App;
