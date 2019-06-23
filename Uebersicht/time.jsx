export const command = "date '+%H:%M'";

export const refreshFrequency = 1000; // ms

export const render = ({ output }) => output;

export const className = `
  // box-sizing: border-box;
  // border: 1px solid white;
  top: 0;
  left: 0;

  width: 100%;

  font-family: -apple-system;
  font-size: 14px;
  line-height: 23px;
  font-weight: 500;
  color: white;

  text-align: center;
`;
