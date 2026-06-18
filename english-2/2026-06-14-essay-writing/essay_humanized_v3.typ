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

Bitcoin is usually introduced as digital money. Some people treat it as an investment, some as a political project, and some as a payment system outside banks. Those descriptions are all partly correct, but they do not explain the whole issue. The more interesting part is how Bitcoin makes trust work. It allows strangers to agree on one transaction history without asking a bank, company, or government office to keep the final record @nakamoto2008.

This setup comes with a real physical cost. Bitcoin uses Proof of Work, which means miners must keep trying different inputs until they find a hash accepted by the network. The work happens inside computers, but it still needs machines, electricity, cooling, internet connectivity, technicians, and buildings that can run all day. Antonopoulos explains that Bitcoin's security depends on making attacks expensive, not on asking users to trust one central party @antonopoulos2017.

This essay focuses on one consequence that is easy to miss. Bitcoin mining did not create artificial intelligence, and mining machines cannot simply become AI machines. However, mining companies built many things that AI companies now need: power access, prepared sites, cooling systems, and experience operating dense computing facilities. In that sense, Bitcoin mining unintentionally helped prepare part of the infrastructure now being used for AI computing @carter2021 @goldman2024. It is not a clean story, but the link is real.

// = From trust in institutions to trust in computation

Normal digital payments depend on an intermediary. A bank checks balances, approves transfers, and keeps the official record. This is convenient because users do not need to maintain the system themselves. The weakness is also clear. If that intermediary makes a mistake, blocks a transaction, changes a rule, or fails, users have little control. Bitcoin tries to reduce that dependency by replacing institutional trust with a shared public ledger @nakamoto2008.

The ledger works because many nodes keep copies of the same transaction history. Transactions are collected into blocks. Each block contains a cryptographic link to the previous block, so an old change would affect the later records too. This design makes tampering visible. It does not require every participant to be honest in a moral sense. It only requires enough participants to follow rules that make cheating costly and difficult to maintain @antonopoulos2017.

Proof of Work is the mechanism behind that cost. Miners compete to find a valid nonce. When the block data and nonce are hashed with SHA-256, the result must be below the target set by the network. There is no clever shortcut where a miner can calculate the correct answer directly. The practical method is repeated guessing at very high speed @antonopoulos2017. After one miner finds a valid block, other nodes can check it quickly.

The security idea is simple but powerful. If an attacker wants to change an old block, the attacker has to redo the work for that block and continue faster than the rest of the network. The more confirmations a transaction has, the more expensive it becomes to rewrite the history. This is why Bitcoin can operate without one final authority. Instead of trusting a bank, you trust the rules the network runs on.

Bitcoin is the most famous case, but the idea has spread further. Andoni et al. show that blockchain has also been studied in the energy sector because distributed ledgers can help parties coordinate records, transactions, and verification @andoni2019. Once Bitcoin became valuable, mining also became valuable. That is when the system started to leave a large physical footprint.

Early mining could be done on ordinary computers. That period did not last. Competition pushed miners toward specialized ASIC machines and then toward larger facilities with cheaper electricity. Mining became an industrial activity. Companies looked for land, grid connections, cooling arrangements, and power contracts. The software idea produced a hardware business.

// = Mining sites as useful AI infrastructure

Bitcoin mining is often discussed mainly through its energy use. That criticism is fair. Mining consumes electricity because Proof of Work deliberately turns energy and computation into security. Over time, miners became good at finding and managing energy-heavy computing sites. Those sites are now valuable for a different reason: AI also needs large amounts of electricity and cooling @eia2024crypto @goldman2024.

The U.S. Energy Information Administration identified 137 cryptocurrency mining facilities in early 2024. It also estimated that cryptocurrency mining could account for about 0.6 percent to 2.3 percent of total U.S. electricity consumption @eia2024crypto. The estimate is broad, and mining sites differ a lot from one another. Even so, the numbers show why this industry suddenly became interesting to AI companies. A company that already has land, permits, power equipment, and a grid connection has something difficult to build quickly.

AI faces a similar problem, only at a larger and faster scale. Goldman Sachs Research expects data-center power demand to rise sharply by 2030, with AI as one of the main drivers @goldman2024. The International Energy Agency reports that data centers consumed around 415 TWh of electricity in 2024 and could reach about 945 TWh by 2030 in its base case @iea2025. Getting GPUs is only part of the problem. Without the right building, power supply, and cooling, those chips cannot run @iea2025.

This is where mining companies have an opening. A mining facility is not automatically ready for AI. AI servers usually need stronger networking, different rack design, more reliable redundancy, and sometimes more advanced cooling. Converting a site can be expensive. But the most painful first steps may already be done. The site exists. The electrical connection exists. The operator already understands that electricity price, uptime, heat, and maintenance decide whether the business works.

Core Scientific is one example. In 2024, the company announced that it would provide about 200 MW of infrastructure to host CoreWeave's high-performance computing services, using sites modified for NVIDIA GPU workloads @core2024. The deal matters because it shows the pivot clearly. The company was not turning Bitcoin ASICs into AI hardware. It was turning power and site capacity into AI hosting capacity.

Other miners have followed a similar path. Reports from CoinDesk and S&P Global Market Intelligence describe public miners selling Bitcoin, signing AI or HPC contracts, and trying to reduce their dependence on mining revenue @malwa2026 @ansari2026. The reason is not mysterious. Bitcoin mining income changes with Bitcoin price, network difficulty, transaction fees, block rewards, machine efficiency, and electricity cost. AI hosting can offer longer contracts and more predictable revenue, although it also requires large capital spending.

The careful claim is this: Bitcoin mining did not cause the AI boom, but it produced assets that AI companies can use. The buildings matter. The substations matter. Power agreements matter. Workers who already know how to run hot, dense, noisy compute rooms also matter. For a company starting from scratch, getting land, permits, and a utility agreement can take longer than buying the servers themselves. These details are less exciting than Bitcoin price or AI models, but they can decide whether a project can actually be built.

// = The machines do not transfer, but the sites do

There is a hard limit to the mining-to-AI story. Bitcoin ASICs are built for one narrow job: calculating SHA-256 hashes as efficiently as possible @antonopoulos2017 @thiel2025. That specialization makes them useless outside of mining.

AI workloads need different hardware. Training and running neural networks depend on matrix operations, memory bandwidth, interconnects between chips, and flexible software stacks. GPUs are useful because they can perform many parallel tasks and support machine-learning frameworks. A Bitcoin ASIC cannot do that. It is closer to a machine built for one factory task @thiel2025.

So the pivot is not a simple recycling story. Mining companies are not taking old ASICs, installing new software, and suddenly producing AI output. They are replacing or supplementing mining hardware with GPU infrastructure. Some may keep mining where it still makes sense. Others may sell older machines or redirect capital toward AI hosting. CoinDesk reported in 2026 that some public miners were selling Bitcoin to fund this transition @malwa2026.

This distinction matters because it keeps the argument realistic. The transferable asset is not the chip. It is the site. A good site has power capacity, cooling options, physical security, fiber connectivity, and an operator who understands high-density computing. Those things take time to acquire. For AI companies under pressure to expand fast, time is often the most expensive resource.

There is also an irony here. Bitcoin was designed to reduce dependence on centralized financial institutions. Yet some of the infrastructure built around Bitcoin is now being used by AI companies, cloud providers, and large customers that are highly centralized. Large AI training runs usually need dense clusters because GPUs must communicate quickly. That favors companies that can finance big facilities and buy scarce hardware at scale @iea2026key.

This does not mean Bitcoin mining was perfectly decentralized before. In practice, mining already favored companies with cheap power, capital, and technical skill. Mining pools also concentrated some decision-making. The ideal image of thousands of equal miners was already complicated. The AI pivot simply makes the concentration easier to see. The same energy-dense facilities can serve a decentralized network one year and a centralized AI customer the next @coindesk2026 @ansari2026.

The shift may also affect Bitcoin itself. CoinDesk reported that Bitcoin's hashrate fell in the first quarter of 2026 for the first time in six years, partly as miners shifted attention and capital toward AI infrastructure @coindesk2026. A lower hashrate does not automatically destroy Bitcoin because the network adjusts difficulty. Still, the economics of mining can influence who remains in the network. If only the strongest operators survive, mining may become even more concentrated.

For AI, the impact is different. More converted sites may help AI companies deploy compute faster. At the same time, it can make power access a strategic gatekeeper. The companies that control energy-ready sites can bargain with AI labs, cloud companies, and investors from a stronger position. In practice, AI development may depend not only on model research but also on land, substations, and cooling equipment.

// = Conclusion

Bitcoin mining did not set out to build infrastructure for AI. It set out to secure a payment network without a trusted intermediary. But Proof of Work made that goal physical. Miners had to find electricity, build facilities, control heat, maintain machines, and keep operations running continuously. Those assets did not disappear when AI demand grew @eia2024crypto @goldman2024.

The strongest argument is not that Bitcoin created AI. That would be too broad and not accurate. AI has its own research history, chip supply chain, and business momentum. The better argument is that Bitcoin mining created or secured part of the physical layer that AI now needs. When AI companies started competing for power and data-center space, some miners were already holding useful sites.

The hardware mismatch is also part of the lesson. Bitcoin ASICs are too specialized to become AI processors, so the pivot depends on replacing machines rather than reusing them. What survives is the less visible infrastructure: warehouses, electrical equipment, grid connections, cooling systems, permits, and operations knowledge. That layer is not as glamorous, but it may last longer than the original mining business model.

This creates an unusual ending to the Bitcoin mining story. A technology built around decentralization helped produce facilities now attractive to centralized AI providers. Bitcoin's lasting effect might not be the payment system people debated, but the warehouses, substations, and power contracts it left behind.

#pagebreak()
#align(center)[ #heading(level: 1, numbering: none)[References] ]
#v(1em)
#set text(size: 0.9em)
#bibliography("references_checked.bib", style: "ieee", title: none)
