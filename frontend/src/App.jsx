import { useEffect } from "react";
import {
  BrowserRouter,
  Routes,
  Route,
  Navigate,
  useLocation,
  useNavigate,
} from "react-router-dom";
import { session } from "./api/client";
import { adminSession } from "./api/admin";
import AdminLogin from "./pages/AdminLogin";
import AdminWorkspace from "./pages/AdminWorkspace";
import AppLayout from "./components/AppLayout";
import Landing from "./pages/Landing";
import Auth from "./pages/Auth";
import Dashboard from "./pages/Dashboard";
import Investments from "./pages/Investments";
import Mining from "./pages/Mining";
import Wallet from "./pages/Wallet";
import Trading from "./pages/Trading";
import CopyTrading from "./pages/CopyTrading";
import Settings from "./pages/Settings";
import NotFound from "./pages/NotFound";
import Policy from "./pages/Policy";
import NftGuide from "./pages/NftGuide";
function RouteEffects() {
  const { pathname } = useLocation();
  const navigate = useNavigate();
  useEffect(() => {
    window.scrollTo(0, 0);
    const pages = {
      "/": [
        "Grave Stone Assets | Digital assets, clearly managed",
        "Explore investing tools and crypto mining, manage your portfolio, and preview the upcoming Grave Stone Assets NFT collection.",
      ],
      "/login": ["Sign in", "Sign in to your Grave Stone Assets account."],
      "/register": [
        "Create your account",
        "Create a Grave Stone Assets account to manage your digital asset portfolio.",
      ],
      "/nft-101": [
        "NFT 101: What are NFTs?",
        "Learn what NFTs are, how digital ownership works, and what to check before buying. Watch our beginner video and explore art, music, and profile NFT examples.",
      ],
    };
    const fallback =
      pathname.split("/").filter(Boolean).pop()?.replaceAll("-", " ") ||
      "Grave Stone Assets";
    const [label, description] = pages[pathname] || [
      fallback,
      "Manage your Grave Stone Assets portfolio, digital assets, and account in one place.",
    ];
    document.title = pathname === "/" ? label : `${label} | Grave Stone Assets`;
    document
      .querySelector('meta[name="description"]')
      ?.setAttribute("content", description);
    document
      .querySelector('meta[property="og:title"]')
      ?.setAttribute("content", pathname === "/" ? label : `${label} | Grave Stone Assets`);
    document
      .querySelector('meta[property="og:description"]')
      ?.setAttribute("content", description);
    document
      .querySelector('meta[name="twitter:title"]')
      ?.setAttribute("content", pathname === "/" ? label : `${label} | Grave Stone Assets`);
    document
      .querySelector('meta[name="twitter:description"]')
      ?.setAttribute("content", description);
  }, [pathname]);
  useEffect(() => {
    const expire = () => navigate("/login", { replace: true });
    const adminExpire = () => navigate("/admin/login", { replace: true });
    window.addEventListener("session-expired", expire);
    window.addEventListener("admin-session-expired", adminExpire);
    return () => {
      window.removeEventListener("session-expired", expire);
      window.removeEventListener("admin-session-expired", adminExpire);
    };
  }, [navigate]);
  return null;
}
function Protected() {
  return session.get() ? <AppLayout /> : <Navigate to="/login" replace />;
}
function ProtectedAdmin() {
  return adminSession.get() ? (
    <AppLayout admin />
  ) : (
    <Navigate to="/admin/login" replace />
  );
}
export default function App() {
  return (
    <BrowserRouter>
      <RouteEffects />
      <Routes>
        <Route path="/" element={<Landing />} />
        <Route path="/login" element={<Auth key="login" />} />
        <Route path="/register" element={<Auth key="register" register />} />
        <Route path="/terms" element={<Policy />} />
        <Route path="/nft-101" element={<NftGuide />} />
        <Route path="/preview" element={<AppLayout preview />}>
          <Route index element={<Dashboard preview />} />
        </Route>
        <Route path="/app" element={<Protected />}>
          <Route index element={<Dashboard />} />
          <Route path="investments" element={<Investments />} />
          <Route path="mining" element={<Mining />} />
          <Route path="wallet" element={<Wallet />} />
          <Route path="trading" element={<Trading />} />
          <Route path="copy-trading" element={<CopyTrading />} />
          <Route path="settings" element={<Settings />} />
        </Route>
        <Route path="/admin/login" element={<AdminLogin />} />
        <Route path="/admin" element={<ProtectedAdmin />}>
          <Route
            index
            element={<AdminWorkspace key="overview" section="overview" />}
          />
          <Route
            path="users"
            element={<AdminWorkspace key="users" section="users" />}
          />
          <Route path="plans" element={<AdminWorkspace key="plans" section="plans" />} />
          <Route path="investments" element={<AdminWorkspace key="investments" section="investments" />} />
          <Route path="mining" element={<AdminWorkspace key="mining" section="mining" />} />
          <Route
            path="wallet-addresses"
            element={<AdminWorkspace key="wallet-addresses" section="wallet-addresses" />}
          />
          <Route
            path="approvals"
            element={<AdminWorkspace key="approvals" section="approvals" />}
          />
          <Route
            path="activity"
            element={<AdminWorkspace key="activity" section="activity" />}
          />
          <Route
            path="profile"
            element={<AdminWorkspace key="profile" section="profile" />}
          />
        </Route>
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}
