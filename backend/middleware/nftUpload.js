const fs = require("fs");
const path = require("path");
const multer = require("multer");
const uploadDir = path.join(__dirname, "..", "uploads", "nfts");
fs.mkdirSync(uploadDir, { recursive: true });
const nftUpload = multer({
  storage: multer.diskStorage({
    destination: (_req, _file, cb) => cb(null, uploadDir),
    filename: (_req, file, cb) => cb(null, `nft-${Date.now()}-${Math.round(Math.random()*1e9)}${path.extname(file.originalname||"").toLowerCase()}`),
  }),
  fileFilter: (_req, file, cb) => {
    const valid = ["image/jpeg","image/png","image/webp","image/gif"].includes(file.mimetype);
    cb(valid ? null : new Error("Only JPG, PNG, WEBP, and GIF images are allowed"), valid);
  },
  limits: { fileSize: 6 * 1024 * 1024 },
});
module.exports = { nftUpload, uploadDir };
