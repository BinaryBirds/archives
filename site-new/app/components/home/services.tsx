import Card from '../UI/card/card';
import styles from './services.module.css';
import {
  HiOutlineBookOpen,
  HiOutlineChatBubbleLeftRight,
  HiOutlineCloudArrowUp,
  HiOutlineSquare3Stack3D,
} from 'react-icons/hi2';

type Service = {
  icon: JSX.Element;
  title: string;
  description: string;
};

type Services = Service[];

const services: Services = [
  {
    icon: <HiOutlineSquare3Stack3D className={styles.icon} />,
    title: 'Full-stack Development',
    description:
      'At our company, we specialize in full-stack development. Our team of experts excels in server-side Swift, as well as in crafting native iOS and Android applications, along with web applications. We have the necessary expertise and resources to build performant apps.',
  },
  {
    icon: <HiOutlineChatBubbleLeftRight className={styles.icon} />,
    title: 'Server-side Swift Consulting',
    description:
      'We provide specialized consulting services for server-side Swift development. Our team of experts offers comprehensive guidance and support tailored to your specific needs. Whether you are building APIs, services, or full-fledged applications, we leverage our in-depth knowledge and experience to help you architect robust, scalable, and efficient server-side solutions using Swift.',
  },
  {
    icon: <HiOutlineCloudArrowUp className={styles.icon} />,
    title: 'Deployment & CI Services or Consulting',
    description: `Our consultancy services specialize in deploying and continuous integration (CI) solutions, with a focus on Amazon Web Services (AWS). Our expert team provides guidance and support to streamline your deployment processes and implement robust CI workflows using AWS tools and services. Whether you're launching web applications, mobile apps, or backend services, we leverage AWS's powerful capabilities to ensure seamless deployment and efficient CI practices, helping you deliver high-quality software at scale.`,
  },
  {
    icon: <HiOutlineBookOpen className={styles.icon} />,
    title: 'Training & Education',
    description: `We offer comprehensive training and education services tailored to your needs. Our expert team provides personalized guidance and support to help you excel in your learning journey. Whether you're looking to enhance your skills in Swift development, iOS and Android app development, or web development, we offer engaging and effective training programs designed to empower you with the knowledge and tools you need to succeed.`,
  },
];

export default function Services() {
  return (
    <section className={styles.servicesSection}>
      <div className={styles.container}>
        {services.map((service, index) => (
          <Card className={styles.serviceCard} key={index}>
            <div className={styles.title}>
              {service.icon}
              <h3>{service.title}</h3>
            </div>
            <p>{service.description}</p>
          </Card>
        ))}
      </div>
    </section>
  );
}
