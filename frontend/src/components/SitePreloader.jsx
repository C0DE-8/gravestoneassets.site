import { useEffect } from "react";
import s from "./SitePreloader.module.css";

export default function SitePreloader({ onReady }) {
  useEffect(() => {
    const timer = window.setTimeout(() => onReady(true), window.matchMedia("(prefers-reduced-motion: reduce)").matches ? 0 : 350);
    return () => window.clearTimeout(timer);
  }, [onReady]);
  return <div className={s.loader} role="status" aria-label="Loading Grave Stone Assets"><div className={s.brand}><span aria-hidden="true"><svg viewBox="0 0 32 32"><path d="M7 26V12a9 9 0 0 1 18 0v14H7Z"/><path d="M16 9v9M12.5 13.5h7M11 26v-3h10v3"/></svg></span><strong>Grave Stone<small>Assets</small></strong></div><p>Preparing your asset view…</p><div className={s.line} /></div>;
}
