const express = require("express");
const { Pool } = require("pg");

require("dotenv").config();

const app = express();
const PORT = 3000;

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

app.use(express.json());

app.get("/health", (req, res) => {
  res.json({
    status: "ok",
  });
});

app.get("/users", async (req, res) => {
  const result = await pool.query("SELECT * FROM users");

  res.json(result.rows);
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});