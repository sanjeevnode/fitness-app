import express from "express";
import { createUser, getUser } from "../controllers/userControllers.js";

const router = express.Router();

router.post("/api/user", createUser);
router.get("/api/user", getUser);

export default router;
