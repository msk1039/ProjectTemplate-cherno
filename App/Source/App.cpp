// #include "Core/Core.h"
#include "Trie/Trie.h"
#include "iostream"
#include "string"
int main()
{
    // Core::PrintHelloWorld();
    // Trie::PrintHelloWorldTrie();
    // std::cout << "hello world";
    const std::string word = "hello1";
    const std::string search_word = "hello1";
    const std::string prefix = "hell";
    data_structures::Trie *obj = new data_structures::Trie();
    obj->insert(word);
    bool param_2 = obj->search(search_word);
    bool param_3 = obj->startsWith(prefix);
    std::cout << "param2: " << param_2 << " param3: " << param_3 << std::endl;
}