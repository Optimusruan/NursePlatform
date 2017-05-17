package dao;

import model.NurseEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import res.PlaceUtil;

import java.util.Random;

/**
 * Created by Administrator on 2017/5/17.
 */
public class NurseInitDao{
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public NurseInitDao(){}
    public void run() {
        Session session = sessionFactory.openSession();

        //生成姓名字典
        String temp = "赵 钱 孙 李 周 吴 郑 王 冯 陈 褚 卫 蒋 沈 韩 杨 朱 秦 尤 许 何 吕 施 张 孔 曹 严 华 金 魏 陶 姜 戚 谢 邹 水 窦 章 云 苏 潘 葛 奚 范 彭 韦 昌 马 苗 凤 花 方 俞 任 袁 鲍 史 唐 费 廉 岑 薛 雷 贺 倪 殷 罗 毕 郝 邬 安 常 乐 于 时 卞 齐 康 伍 余 元 卜 顾 孟 平 穆 萧 尹 姚 邵 湛 汪 祁 毛 禹 贝 明 臧 计 伏 成 戴 谈 宋 茅 纪 舒 屈 项 祝 董 梁 杜 阮 蓝 季 麻 强 贾 路 娄 危 江 童 颜 盛 林 刁 锺 徐 邱 骆 高 夏 蔡 胡 凌 霍 虞 万 支 柯 昝 管 卢 莫 经 房 裘 缪 干 解 应 宗 丁 宣 贲 邓 郁 单 杭 洪 包 诸 左 石 崔 吉 钮 龚 程 嵇 邢 滑 裴 陆 荣 翁 荀 羊 於 麴 家 封 芮 羿 储 靳 汲 邴 糜 松 井 段 富 巫 乌 焦 巴 弓 牧 隗 山 侯 宓 蓬 全 郗 班 仰 秋 仲 伊 宫 宁 仇 栾 暴 甘 钭 历 戎 祖 武 符 刘 景 詹 束 龙 叶 幸 司 韶 郜 黎 蓟 溥 印 宿 白 怀 蒲 邰 从 鄂 索 咸 籍 蔺 屠 蒙 池 乔 阳 郁 胥 能 苍 双 闻 莘 党 翟 谭 贡 劳 逄 姬 申 扶 堵 冉 宰 郦 雍 却 璩 桑 桂 濮 牛 寿 通 边 扈 燕 冀 僪 浦 尚 农 温 别 庄 晏 柴 瞿 阎 充 慕 连 茹 习 宦 艾 鱼 容 向 古 易 慎 戈 廖 庾 终 暨 居 衡 步 都 耿 满 弘 匡 国 文 寇 广 禄 阙 东 欧 殳 沃 利 蔚 越 夔 隆 师 巩 厍 聂 晁 勾 敖 融 冷 訾 辛 阚 那 简 饶 空 曾 毋 沙 乜 养 鞠 须 丰 巢 关 蒯 相 查 后 荆 红 游 竺 权 逮 盍 益 桓 公 召 有 舜 丛 岳 寸 贰 皇 侨 彤 竭 端 赫 实 甫 集 象 翠 狂 辟 典 良 函 芒 苦 其 京 中 夕 之 冠 宾 香 果 蹇 称 诺 来 多 繁 戊 朴 回 毓 税 荤 靖 绪 愈 硕 牢 买 但 巧 枚 撒 泰 秘 亥 绍 以 壬 森 斋 释 奕 姒 朋 求 羽 用 占 真 穰 翦 闾 漆 贵 代 崇 栋 告 休 褒 谏 锐 皋 闳 在 示 是 委 钊 频 嬴 呼 大 威 昂 律 冒 保 系 抄 定 化 莱 校 么 抗 祢 綦 悟 宏 功 庚 务 敏 捷 拱 兆 丑 丙 随 类 卯 俟 友 答 乙 允 甲 留 尾 佼 玄 乘 裔 延 植 环 矫 赛 昔 侍 度 旷 遇 偶 前 由 咎 塞 敛 受 泷 袭 圣 御 夫 仆 镇 藩 邸 府 掌 首 员 焉 戏 可 智 尔 凭 悉 进 笃 厚 仁 业 肇 资 合 仍 九 衷 哀 刑 俎 仵 圭 夷 徭 蛮 汗 孛 乾 帖 罕 洛 淦 洋 邶 郸 郯 邗 邛 剑 虢 隋 蒿 茆 菅 苌 树 桐 锁 钟 机 盘 铎 斛 玉 线 针 箕 庹 绳 磨 蒉 瓮 弭 刀 疏 牵 浑 恽 势 世 仝同 蚁 止 戢 睢 冼 种 涂 肖 己 泣 潜 卷 脱 谬 蹉 赧 浮 顿 说 次 错 念 夙 斯 完 丹 表 聊 源 姓 吾 寻 展 出 不 户 闭 才 无 书 学 愚 本 性 雪 霜 烟 寒 少 字 桥 板 斐 独 千 诗 嘉 扬 善 揭 祈 析 赤 紫 青 柔 刚 奇 拜 佛 陀 弥 阿 素 长 僧 隐 仙 隽 宇 祭 酒 淡 塔 琦 闪 始 星 南 天 接 波 碧 速 禚 腾 潮 镜 似 澄 潭 謇 纵 渠 奈 风 春 濯 沐 茂 英 兰 檀 藤 枝 检 生 折 骑 貊 虎 肥 鹿 雀 野 禽 飞 节 宜 鲜 粟 栗 豆 帛 官 布 衣 藏 宝 钞 盈 庆 喜 及 普 建 营 巨 望 希 道 载 声 漫 犁 力 贸 勤 革 改 兴 亓 睦 修 信 闽 北 守 坚 勇 汉 练 尉 士 令 将 旗 军 行 奉 敬 恭 仪 母 义 礼 慈 孝 理 伦 卿 问 永 辉 尧 依 犹 介 承 市 所 苑 杞 剧 第 零 谌 招 续 达 忻 六 鄞 战 迟 候 粘 萨 邝 覃 辜 初 楼 城 区 局 台 原 考 妫 纳 泉 老 清 德 卑 过 麦 曲 竹 百 福 言 佟 爱 年 笪 谯 哈 墨 赏 伯 佴 佘 牟 商 琴 后 况 亢 缑 帅 海 归 钦 鄢 汝 法 闫 楚 晋 督 仉 盖 逯 库 郏 逢 阴 薄 厉 稽 开 光 操 瑞 眭 泥 运 摩 迮 ";
        String[] nameDict = temp.split(" ");
        int lengthOfNameDict = nameDict.length;

        //生成年龄字典
        String[] ageDict = {"40","41","42","43","44","45","46","47","48","49","50"};
        int lengthOfAgeDict = ageDict.length;

        Random random = new Random(0);
        for (int i = 0; i < 2500; i++) {
            Transaction transaction = session.beginTransaction();
            NurseEntity nurseEntity = new NurseEntity();
            random.setSeed(i);
            //生成Id
            nurseEntity.setNurId(i+1000);

            //生成联系方式
            nurseEntity.setNurIdno(new Integer(Math.abs(random.nextInt()%1000000000)).toString());

            //生成名字
            int randomIndex1 = Math.abs(random.nextInt()%lengthOfNameDict);
            int randomIndex2 = Math.abs(random.nextInt()%lengthOfNameDict);
            int randomIndex3 = Math.abs(random.nextInt()%lengthOfNameDict);
            nurseEntity.setNurName(nameDict[randomIndex1]+nameDict[randomIndex2]+nameDict[randomIndex3]);

            //生成年龄
            nurseEntity.setNurAge(new Integer(ageDict[Math.abs(random.nextInt()%lengthOfAgeDict)]));

            //生成等级
            nurseEntity.setNurRank(i/500+1);

            //生成用户名密码
            nurseEntity.setNurUname("nurse"+(i+1));
            nurseEntity.setNurPwd("nurse"+(i+1));

            //生成住址
            int provinceIndex = Math.abs(random.nextInt()%PlaceUtil.place.length);
            int cityIndex = Math.abs(random.nextInt()%PlaceUtil.place[provinceIndex].length)-1;
            String address = PlaceUtil.place[provinceIndex][0]+PlaceUtil.place[provinceIndex][1+cityIndex];
            nurseEntity.setNurAdd(address);


            session.save(nurseEntity);
            transaction.commit();
        }

//        System.out.println(randomIndex1+","+randomIndex2+","+randomIndex3);
        System.out.println("size:" + lengthOfNameDict);

    }


}
