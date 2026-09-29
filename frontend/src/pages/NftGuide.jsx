import { Link } from "react-router-dom";
import { FiArrowLeft, FiArrowUpRight, FiCheckCircle, FiExternalLink, FiImage, FiMusic, FiShield } from "react-icons/fi";
import { Brand, Button } from "../components/UI";
import nftIntro from "../assets/nft/nft.png";
import nftArt from "../assets/nft/art-nfts.png";
import nftMusic from "../assets/nft/music-nft.png";
import nftProfile from "../assets/nft/peps.png";
import s from "./NftGuide.module.css";

const examples = [
  { image: nftArt, alt: "Colorful digital art made from a field of painted dots", icon: FiImage, title: "Art NFTs", text: "A token can point to a digital artwork and record which wallet currently holds it. The artwork itself may be stored separately from the token." },
  { image: nftMusic, alt: "Illustrated musician resting in a green landscape", icon: FiMusic, title: "Music NFTs", text: "A music NFT may be connected to a track, release, or collectible edition. What ownership gives you depends on the creator’s stated terms." },
  { image: nftProfile, alt: "Illustrated character portrait in a cowboy hat", icon: FiImage, title: "Profile and character NFTs", text: "Some collections use distinctive character images as profile pictures or collectibles. A token does not automatically grant copyright or commercial rights." },
];

export default function NftGuide() {
  return (
    <main className={s.page}>
      <header className={s.header}>
        <Brand />
        <nav className={s.headerActions}><Link to="/about">About Grave Stone Assets <FiArrowUpRight /></Link><Link to="/"><FiArrowLeft /> Back home</Link></nav>
      </header>
      <section className={s.hero}>
        <div className={s.heroCopy}>
          <span className={s.eyebrow}>A BEGINNER’S GUIDE · NFT 101</span>
          <h1>What is an NFT?</h1>
          <p>An NFT is a unique token recorded on a blockchain. It can be associated with digital art, music, collectibles, or other items, and can help show which wallet holds that token.</p>
          <p className={s.caveat}>NFT ownership is not automatically the same as owning the copyright, the underlying file, or exclusive rights to use it.</p>
          <a className={s.jumpLink} href="#video">Watch the short introduction <FiArrowUpRight /></a>
        </div>
        <img className={s.heroImage} src={nftIntro} alt="Illustration of digital collectibles, music, sport, and creative tools" />
      </section>

      <section className={s.videoSection} id="video">
        <div><span className={s.eyebrow}>VIDEO INTRODUCTION</span><h2>NFTs, explained for beginners.</h2><p>This video introduces NFTs through the OpenSea marketplace. Marketplace screens and policies can change, so use it as a starting point and check current details before acting.</p></div>
        <div className={s.videoFrame}>
          <iframe src="https://www.youtube-nocookie.com/embed/w6JEE8DVdJs?rel=0" title="NFTs explained for beginners — OpenSea introduction" loading="lazy" referrerPolicy="strict-origin-when-cross-origin" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen />
          <a href="https://youtu.be/w6JEE8DVdJs" target="_blank" rel="noreferrer">Open this video on YouTube <FiExternalLink /></a>
        </div>
      </section>

      <section className={s.basics}>
        <span className={s.eyebrow}>THE BASICS</span>
        <h2>Three things to understand.</h2>
        <div className={s.basicGrid}>
          <article><span>01</span><h3>Unique token</h3><p>NFT means non-fungible token. Unlike interchangeable coins of the same type, each token has its own identifier.</p></article>
          <article><span>02</span><h3>Blockchain record</h3><p>The blockchain records token activity and the wallet that holds it. Media files and descriptions may be stored elsewhere.</p></article>
          <article><span>03</span><h3>Rights vary</h3><p>Buying a token does not by itself transfer copyright. Read the collection terms to learn what rights, if any, come with it.</p></article>
        </div>
      </section>

      <section className={s.examples}>
        <div className={s.sectionHeading}><div><span className={s.eyebrow}>COMMON NFT FORMATS</span><h2>What can an NFT represent?</h2></div><p>Examples vary by creator and collection.<br />The token’s terms matter.</p></div>
        <div className={s.exampleGrid}>{examples.map(({ image, alt, icon: Icon, title, text }) => <article key={title} className={s.exampleCard}><img src={image} alt={alt} loading="lazy" /><div><span><Icon /> DIGITAL COLLECTIBLE</span><h3>{title}</h3><p>{text}</p></div></article>)}</div>
      </section>

      <section className={s.safety}>
        <FiShield />
        <div><span className={s.eyebrow}>BEFORE YOU BUY</span><h2>Pause and check the details.</h2><ul><li><FiCheckCircle /> Verify the collection and creator from their official channels.</li><li><FiCheckCircle /> Read the item description, rights, fees, and marketplace terms.</li><li><FiCheckCircle /> Check the wallet address and network before sending anything.</li><li><FiCheckCircle /> Be wary of unsolicited links, fake support, and promises of guaranteed value.</li></ul></div>
      </section>

      <section className={s.footerCta}><span className={s.eyebrow}>KEEP EXPLORING</span><h2>Learn about Grave Stone Assets.</h2><p>Find out how our investment tools, mining workspace, trading features, and copy trading fit together.</p><div className={s.footerActions}><Button to="/about">About Grave Stone Assets <FiArrowUpRight /></Button><Button to="/#nft" secondary>View NFT preview <FiImage /></Button></div></section>
      <footer className={s.footer}><Brand /><p>NFTs can be volatile and may lose value. This guide is educational and is not investment advice.</p><Link to="/terms">Terms &amp; investment policy <FiArrowUpRight /></Link></footer>
    </main>
  );
}
