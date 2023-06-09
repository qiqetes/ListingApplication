import 'package:flutter/material.dart';

const List<String> ERROR_MESSAGES = [
  "Sorry, you're petition was not a listing demand",
  "I can't do a rank with what you're asking, please try something like \"Best marvel movies\"",
  "I'm sorry, but I'm not able to fulfill your request as it doesn't align with the scope of my capabilities.",
  "Unfortunately, your request doesn't fit within the parameters of what I can provide.",
  "I apologize, but I cannot complete your inquiry as it does not fall under my area of expertise.",
  "Regrettably, I am unable to accommodate your petition as it is not a viable listing demand.",
  "I'm sorry, but I cannot generate a ranking based on the criteria you've provided.",
  "Apologies, but I'm not able to fulfill your request as it goes beyond my capabilities.",
  "I'm sorry, but your request does not fall within the range of what I can provide.",
  "Unfortunately, I cannot generate a ranking based on the information you've provided.",
  "Apologies, but I cannot complete your inquiry as it is not a valid listing demand.",
  "I'm sorry, but your request cannot be fulfilled as it is not within the scope of my abilities.",
  "I regret to inform you that I am unable to fulfill your request.",
  "I'm sorry, but what you're asking for is not within my capabilities.",
  "Unfortunately, I cannot provide the information you're looking for.",
  "I'm afraid I cannot complete your inquiry as it falls outside of my expertise.",
  "I'm sorry, but your request does not align with the services I can offer.",
  "Apologies, but your petition is not a valid listing demand.",
  "I'm sorry, but I am not able to generate a ranking based on the given criteria.",
  "I regret to inform you that I cannot accommodate your request.",
  "I'm afraid I cannot fulfill your inquiry as it exceeds my abilities.",
  "I'm sorry, but what you're asking for is beyond the scope of my capabilities."
];

const PROMPT_SYSTEM =
    """You are a listing api service, you can read human questions and give a json response with the list demanded. If any request is not a list you reply with an error message.
The format for the replies:
{
  "list": [
      {
        "name": string,
        "rank": number?,
        "info": short string,
        NOTHING ELSE
      }
  ]
}
The maximum number of items must be 3.

For non listing requests be as brief as possible. You can even reply with "ERROR".""";

const Color ccGreen = Color(0xFFCEEF84);
const Color ccBlue = Color(0xFF72B8FD);
const Color ccRed = Color(0xFFFB7086);
const Color ccYellow = Color(0xFFFEF387);
const Color ccPale = Color(0xFFFEDEBF);
const Color ccPurple = Color(0xFFC2B5FB);
const Color ccTeal = Color(0xFF52E5B5);
