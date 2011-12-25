## Description

A very simple T9 decoder using ruby.

## Usage

  decoder = T9.new
  valid_words = decoder.valid_words_using [4,3,5,5,6]  #=> ["hello"]