require("coffee-script/register");
var express = require("express");
var server = module.exports = express();
require("./server")(express, server);