import { Link } from "react-router-dom";
import { FiActivity, FiArrowLeft, FiArrowUpRight, FiCpu, FiLayers, FiUsers, FiShield, FiImage } from "react-icons/fi";
import { Brand, Button } from "../components/UI";
import s from "./About.module.css";

const offerings = [
  { icon: FiLayers, number: "01", title: "Investment plans", text: "Review the plans available on the platform, compare their stated terms, and follow your investment activity and account balances in one place.", action: "Explore investments", to: "/app/investments" },
  { icon: FiCpu, number: "02", title: "Mining workspace", text: "Browse configured equipment levels, review power and battery details, and manage miner run time and credited earnings from your account.", action: "Explore mining", to: "/app/mining" },
  { icon: FiActivity, number: "03", title: "Trading tools", text: "Follow supported markets, review charts, and check trade details before submitting an available trade from your account.", action: "Explore trading", to: "/app/trading" },
  { icon: FiUsers, number: "04", title: "Copy trading", text: "Review available trader profiles and their displayed terms, then follow a copy request from your dashboard. Past results do not predict future performance.", action: "Explore copy trading", to: "/app/copy-trading" },
  { icon: FiImage, number: "05", title: "NFT learning", text: "Start with an NFT 101 guide to understand digital tokens, ownership records, creator rights, and practical checks before using a marketplace.", action: "Read NFT 101", to: "/nft-101" },
  { icon: FiShield, number: "06", title: "Account overview", text: "Keep profile verification, wallet requests, activity, and account settings together so you can review what is happening in your workspace.", action: "Preview the workspace", to: "/preview" },
];

export default function About() {
  return (
    <main className={s.page}>
      <header className={s.header}><Brand /><Link to="/"><FiArrowLeft /> Back to home</Link></header>
      <section className={s.hero}>
        <span className={s.eyebrow}>ABOUT GRAVE STONE ASSETS</span>
        <h1>Digital asset tools, brought together.</h1>
        <p>Grave Stone Assets is a platform for exploring investment plans, managing a mining workspace, reviewing supported trading tools, and learning about digital collectibles.</p>
        <div className={s.heroActions}><Button to="/register">Create your account <FiArrowUpRight /></Button><Button to="/preview" secondary>Preview the workspace <FiArrowUpRight /></Button></div>
      </section>
      <section className={s.offerings}>
        <div className={s.sectionHeading}><div><span className={s.eyebrow}>EXPLORE THE PLATFORM</span><h2>Choose a place to start.</h2></div><p>Features and availability depend on your account<br />and the options currently configured on the platform.</p></div>
        <div className={s.grid}>{offerings.map(({ icon: Icon, number, title, text, action, to }) => <article key={title} className={s.card}><div className={s.cardTop}><span>{number}</span><Icon /></div><h3>{title}</h3><p>{text}</p><Link to={to}>{action}<FiArrowUpRight /></Link></article>)}</div>
      </section>
      <section className={s.aiNote}><div><span className={s.eyebrow}>AI ASSISTED MINING</span><h2>Tools to monitor your mining activity.</h2><p>The mining workspace provides equipment controls, runtime and battery details, and earning records. Any AI related mining features should be understood through the controls and descriptions shown in your account; mining activity and digital assets carry risk and do not guarantee returns.</p><Button to="/app/mining" secondary>See mining workspace <FiArrowUpRight /></Button></div><FiCpu aria-hidden="true" /></section>
      <section className={s.disclosure}><FiShield /><p><strong>Understand the risks.</strong> Digital assets, trading, mining, and investment activity can lose value or result in loss. Review product details and terms before participating. Nothing on this site guarantees a return or is personal financial advice.</p></section>
      <footer className={s.footer}><Brand /><span>Grave Stone Assets · Digital assets, clearly managed.</span><Link to="/terms">Terms &amp; investment policy <FiArrowUpRight /></Link></footer>
    </main>
  );
}
