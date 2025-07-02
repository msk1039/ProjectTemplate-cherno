#pragma once
#include <iostream>
#include <string>
namespace data_structures
{

    void PrintHelloWorldTrie();
    class Node
    {
    public:
        Node *links[26] = {nullptr};
        bool flag = false;

        bool containsKey(char ch);
        Node *get(char ch);
        void put(char ch, Node *node);
        bool isEnd();
        void setEnd();
        ~Node();
    };
    class Trie
    {
    private:
        Node *root;

    public:
        Trie();
        ~Trie();
        void insert(std::string word);
        bool search(std::string word);
        bool startsWith(std::string prefix);
    };
}