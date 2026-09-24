#let title = "Blockchain and Bitcoin: Mechanics, Myths, and The AI Pivot"

#set document(
  title: title,
  author: "Group Eleven",
)

#set page(paper: "a4", margin: 1in)
#set text(font: "Times New Roman", size: 12pt)
#set par(justify: true, first-line-indent: (all: true, amount: 0.5in))
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 14pt)
#show heading.where(level: 2): set text(size: 13pt)


#align(center)[
  #text(size: 16pt, weight: "bold")[#title] \
  #v(0.15em)
  Atalariq\_Ruhana\_Reyhan\_Fahmi
]

#line(length: 100%)

// = Introduction

Most people who have heard of Bitcoin think of it as either a speculative investment or an alternative to regular money. That framing is not wrong, but it misses what is arguably more interesting: the physical infrastructure that Bitcoin mining built over the past decade and what happened to that infrastructure once AI came along. This essay argues that even though Bitcoin mining and artificial intelligence have almost nothing in common technically, the buildings, power connections, and operational knowledge that miners accumulated have quietly become useful to the AI industry. The hardware does not transfer. The sites do. That gap between the original purpose of a technology and what its physical remains get used for is worth thinking about seriously.

// = From trust in institutions to trust in computation

To understand why mining produced so much infrastructure in the first place, it helps to understand what Bitcoin is actually trying to solve. Normal digital payments depend on a middleman. A bank checks balances, approves transfers, and keeps the final record. This is convenient but it creates a single point of failure. If the bank makes a mistake, freezes an account, or changes its rules, the user has few options. Bitcoin's answer, as Nakamoto describes it, is to replace that institutional trust with a shared public ledger that anyone can verify @nakamoto2008.

The ledger works because many independent nodes keep identical copies of the transaction history. Transactions are grouped into blocks, and each block is cryptographically linked to the one before it. If someone tries to alter an old record, that change breaks the link and becomes visible to the rest of the network. The system does not need every participant to be honest. It only needs enough of them following rules that make cheating more expensive than it is worth @antonopoulos2017.

Proof of Work is what creates that cost. Miners compete to find a number, called a nonce, such that when it is combined with the block data and run through SHA-256, the result falls below a target the network sets. There is no formula to find it directly. Miners just try billions of guesses per second until someone gets lucky @antonopoulos2017. The winner adds the block and collects a reward. Everyone else starts over on the next block.

This matters for the infrastructure argument because Proof of Work ties security to real-world resource consumption. The more computing power the network has, the more expensive it becomes to attack. Antonopoulos makes the point that this is a deliberate design choice: the cost is the security @antonopoulos2017. And because the cost is real, it scales into physical things. Machines, electricity, buildings, cooling. Bitcoin's security model does not just require computation in the abstract. It requires industrial-scale computation running continuously.

Early mining was done on regular computers. That did not last. As Bitcoin gained value, competition pushed miners toward custom ASIC chips designed only for SHA-256. Then toward facilities with cheaper electricity. Then toward purpose-built data centers in places where power was abundant. What started as a software protocol ended up creating a new kind of energy-heavy industry. The blockchain's use in other sectors, such as energy coordination, has also been noted @andoni2019, but Bitcoin's scale made it the case where this physical footprint became hardest to ignore.

// = Mining sites as useful AI infrastructure

Bitcoin mining gets most of its public attention through energy criticism, and that criticism is fair. Proof of Work uses electricity by design. The U.S. Energy Information Administration identified 137 cryptocurrency mining facilities in early 2024 and estimated that crypto mining could account for somewhere between 0.6 and 2.3 percent of total U.S. electricity consumption @eia2024crypto. That is a wide range and it reflects how much sites vary, but even the low end is a significant share of national grid load.

What is less often discussed is what those facilities actually represent as physical assets. A mining site that has been running for several years is not just a building with computers in it. It has a utility-scale power connection, which can take years to get approved and built. It has cooling infrastructure designed to handle servers running at full load around the clock. It has staff who already know how to keep dense computing equipment alive in hot, loud conditions. For most industries, those things are boring. For AI, they are a bottleneck.

Goldman Sachs Research projects that data center power demand could rise sharply by 2030, with AI as the main driver @goldman2024. The International Energy Agency puts the numbers at roughly 415 TWh consumed by data centers in 2024, potentially reaching 945 TWh by 2030 in their base case @iea2025. The scale of that growth means the constraint is not only about buying GPUs. It is about having places to put them. Permits, grid connections, and cooling systems take time to build that chip production does not.

This is the opening that mining companies found themselves sitting in. Core Scientific announced in 2024 that it would provide approximately 200 MW of infrastructure to host CoreWeave's high-performance computing services, converting its sites for NVIDIA GPU workloads @core2024. That deal is a useful example because it shows clearly what is and is not being transferred. Core Scientific was not repurposing its Bitcoin ASICs. It was repurposing its power capacity, its prepared sites, and its operational experience. The chips got replaced. The rest stayed.

Other mining companies have moved in similar directions. CoinDesk and S&P Global Market Intelligence report that public miners have been selling Bitcoin holdings, signing AI and HPC hosting contracts, and actively reducing how much of their revenue depends on mining @malwa2026 @ansari2026. The appeal is not hard to understand. Mining income swings with Bitcoin price, network difficulty, block rewards, and electricity costs, all at once. AI hosting contracts tend to be longer and more stable, even if setting up for them requires significant upfront spending.

The honest version of this argument is narrower than it might first sound. Bitcoin mining did not cause the AI infrastructure shortage, and not every mining site is usable for AI work. AI servers have stricter requirements for networking, rack design, and redundancy than mining rigs do. Conversion is real work and real cost. But for a company trying to deploy AI compute quickly, acquiring a site that already has land, a utility agreement, and a working power connection is meaningfully faster than starting from nothing. That is the actual claim, and it is worth keeping specific.

// = The machines do not transfer, but the sites do

The limits of this story matter as much as the opportunity. Bitcoin ASICs are built for one task: computing SHA-256 hashes as fast and as efficiently as possible @antonopoulos2017 @thiel2025. That narrow specialization is exactly what makes them good miners, and also what makes them useless for AI. A Bitcoin ASIC cannot run a neural network. It does not have the memory bandwidth, the floating-point capacity, or the software support that machine learning requires. It is closer to a machine optimized for one specific factory process. Fast at that process, irrelevant outside it @thiel2025.

AI workloads need GPUs, or increasingly custom accelerators, that can handle matrix operations across large datasets, communicate quickly between chips, and run frameworks like PyTorch or TensorFlow. None of that runs on a SHA-256 machine. So when mining companies say they are pivoting to AI, they mean they are replacing their mining hardware with GPU infrastructure, not reprogramming what they already have. CoinDesk reported in 2026 that some public miners were selling Bitcoin specifically to fund that hardware replacement @malwa2026. The pivot requires new capital, not a software update.

This distinction matters because it keeps the argument from overstating what is happening. The transferable asset is the site, not the machine. A good site has power capacity, cooling, physical security, fiber connectivity, and staff who understand dense computing. Those things take years to put together. For AI companies that need to scale fast, buying time by acquiring a ready site is worth a lot. The chip inside is a separate purchase.

There is also a tension in this transition that is easy to miss. Bitcoin was designed around the idea of reducing dependence on centralized institutions. The whole point of the public ledger was that no single company or government should control the record. Yet the infrastructure that came out of Bitcoin mining is now being absorbed by some of the most centralized players in the technology industry: large cloud providers, AI labs, and enterprise computing customers. Large AI training jobs need GPUs packed closely together because the chips have to communicate constantly. That setup favors organizations that can afford massive facilities and buy hardware at scale @iea2026key.

Bitcoin mining was never fully decentralized in practice. Mining pools concentrated decision-making early on, and cheap electricity and capital favored large operators over individuals. But the AI pivot makes the gap between the original ideal and the operational reality more visible. The same facilities that were supposed to support a distributed, permissionless network are now available to serve whoever has the most money and the fastest expansion plans @coindesk2026 @ansari2026.

CoinDesk reported that Bitcoin's hashrate fell in the first quarter of 2026 for the first time in six years, partly because miners were redirecting capital and attention toward AI @coindesk2026. The network adjusts its difficulty automatically, so a falling hashrate does not break Bitcoin. But if the economics keep pushing smaller miners out, the network becomes more concentrated in fewer hands. That is not a catastrophic outcome, but it is a different Bitcoin than the one Nakamoto described @nakamoto2008.

For AI, the effect goes in the other direction. More converted sites mean faster deployment of compute. But control over energy-ready facilities also becomes a source of leverage. The companies holding those sites can negotiate from a stronger position with AI labs, cloud providers, and investors. In this sense, the AI buildout may depend as much on who controls land and substations as on who has the best models.

// = Conclusion

Bitcoin mining was not built to serve AI. It was built to secure a payment network that did not need a trusted middleman. But Proof of Work made that goal physical, and the physical assets it produced did not disappear when AI demand started growing @eia2024crypto @goldman2024.

The argument in this essay is not that Bitcoin caused AI or that the two industries are deeply connected by design. They are not. AI has its own research history, its own chip supply chains, and its own business logic. The narrower claim is that Bitcoin mining happened to build something the AI industry now needs: prepared sites with power, cooling, and operational experience. When AI companies started competing for data-center space, some miners were already holding assets that fit.

The hardware gap is real and it matters. ASICs cannot become GPUs. The transition requires new machines, new capital, and genuine conversion work. What carries over is the infrastructure layer underneath: the warehouse, the electrical gear, the grid connection, the cooling system, the permits. That layer is unglamorous, but it may outlast the original mining business by a significant margin.

What is perhaps most interesting is what this says about how technologies leave their mark. Bitcoin was built around decentralization. It is now leaving behind facilities that centralized AI providers find attractive. The technology's lasting impact may not be the payment system or the financial speculation that dominated public debate for years. It may be the substations and power contracts that nobody was paying attention to.

#pagebreak()
#align(center)[ #heading(level: 1, numbering: none)[References] ]
#v(1em)
#set text(size: 0.9em)
#bibliography("references_checked.bib", style: "apa", title: none)
