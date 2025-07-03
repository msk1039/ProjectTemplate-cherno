#include "Trie.h"

#include <iostream>

namespace data_structures
{

    void PrintHelloWorldTrie()
    {
        std::cout << "Hello World clion Trie!\n";
        std::cin.get();
    }

    bool Node::containsKey(char ch)
    {
        return (links[ch - 'a'] != nullptr);
    }

    Node *Node::get(char ch) const
    {
        return links[ch - 'a'];
    }

    void Node::put(char ch, Node *node)
    {
        links[ch - 'a'] = node;
    }

    bool Node::isEnd() const
    {
        return flag;
    }
    void Node::setEnd()
    {
        flag = true;
    }
    Node::~Node()
    {
        for (auto & link : links)
        {
            if (link != nullptr)
            {
                delete link;
                link = nullptr;
            }
        }
    }

    Trie::Trie()
    {
        root = new Node();
    }
    Trie::~Trie()
    {
        delete root;
    }
    void Trie::insert(std::string word)
    {
        Node *current = root;
        for (int i = 0; i < word.length(); ++i)
        {
            if (!current->containsKey(word[i]))
            {
                current->put(word[i], new Node());
            }
            current = current->get(word[i]);
        }

        current->setEnd();
    }

    bool Trie::search(std::string word)
    {
        Node *current = root;
        for (int i = 0; i < word.length(); ++i)
        {
            if (!current->containsKey(word[i]))
            {
                return false;
            }
            current = current->get(word[i]);
        }

        if (current->isEnd())
            return true;
        return false;
    }

    bool Trie::startsWith(std::string prefix)
    {
        Node *current = root;
        for (int i = 0; i < prefix.length(); ++i)
        {
            if (!current->containsKey(prefix[i]))
            {
                return false;
            }
            current = current->get(prefix[i]);
        }
        return current != nullptr;
    }

}