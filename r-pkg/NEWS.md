# spongebob 0.4.0

- `tospongebob` is now an S3 generic function! This means you can use it to convert baSIcaLLY aNyThiNg yOU CaN dREAm oF. If you dream of something that doesn't work, please [report it in our issue tracker](https://github.com/jayqi/spongebob/issues), and we'll try our best to mAKe yoUr drEaMS ComE TrUE. DOn'T LeT yOUR dreAmS juST Be DrEaMS. 
- `spongebobsay` and friends accordingly now also take basically any input. 
- `spongebobsay` and friends now adjust width based on the longest word, with a minimum of 40 characters by default. You can also specify a value using the new `width` argument.

# spongebob 0.3.0

- New family of functions `spongebobsay`, `spongebobthink`, and `spongebobwhisper` that let you have ASCII Spongebob--in the style of cowsay--deliver your message WitH VisuAl flAiR aNd soPhIsTIcATIoN. 
- Standalone ASCII Mocking Spongebob art available as a character string via new function `ascii_spongebob` in case you want him to gAzE SiLEntlY aT You.

```
 ----------------------------------------- 
| neW fAMilY Of fUNCtiOns `sPOnGEboBsAy`, |
| `spONGeBoBTHinK`, aNd `sPonGEboBtHinK`  |
| THAt lET you HavE AsCiI sPOnGEbob--In   |
| the STyLe oF CowSAy--DeliVeR YoUR       |
| mesSaGe wiTh vISuaL FlAIr AND           |
| SophIStIcaTioN.                         |
 ----------------------------------------- 
  \\
   \\    *
          *
     ----//-------
     \..C/--..--/ \   `A
      (@ )  ( @) \  \// |w
       \          \  \---/
        HGGGGGGG    \    /`
        V `---------`--'
            <<    <<
           ###   ###
```

# spongebob 0.2.0

- `tospongebob`'s 1-, 2-, and 3-length subsequences now sample from a distribution whose proportions follow the golden ratio, for mORe pLeASing AEstHetiCS ThAT rEfleCt nATUre. 
- `tospongebob` now ignores non-alphabetic characters when alternating casing. This avoids situations like `"THis one"` where the whitespace ate up an uppercase subsequence. 
