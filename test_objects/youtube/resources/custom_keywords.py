from random_word import RandomWords

def get_random_word(max_len = 10):
    r = RandomWords()
    word = r.get_random_word()
    while len(word) > max_len:
        word = r.get_random_word()
    return word
