import express from 'express'; 
import os from 'os'; 

const app = express(); 
const port = 3000;

app.get('/', (req, res) => {
  const message = `Hello world from Pod ${os.hostname()} version: latest`;
  res.send(message);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
