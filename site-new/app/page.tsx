import Footer from './components/home/footer';
import Hero from './components/home/hero';
import Services from './components/home/services';
import styles from './page.module.css';

export default function Home() {
  return (
    <main className={styles.main}>
      <Hero />
      <Services />
      <Footer />
    </main>
  );
}
