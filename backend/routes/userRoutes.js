import express from "express";
import {
  createUser,
  getUser,
  getUserById,
} from "../controllers/userControllers.js";

const router = express.Router();

router.post("/api/user", createUser);
router.get("/api/user", getUser);
router.get("/api/user/:id", getUserById);

export default router;
