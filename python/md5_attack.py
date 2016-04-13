import hashlib
hash_to_crack = "098f6bcd4621d373cade4e832627b4f6"
dict_file = "data/dict.txt"

def main():
    with open(dict_file) as fileobj:
        for line in fileobj:
            line = line.strip().encode('utf-8')
            if hashlib.md5(line).hexdigest() == hash_to_crack:
                print("successfully cracked the hash {}: password is: {}".format(hash_to_crack, line.decode('utf-8')))
                return ""
    print("Failed to crack the file.")

if __name__ == "__main__":
    main()
